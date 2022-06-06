const express = require("express");
const app = express();
const path = require("path");
const cors = require("cors");
const gracefulShutdown = require("http-graceful-shutdown");
const authGitHub = require("./lib/security/authGitHub.js");

const port = process.env.PORT || 5000;

//set middleware
app.set("view engine", "ejs");
app.disable("x-powered-by");
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// initialize passport and express-session
app.use(...authGitHub.initialize());

// dynamic resource rooting
app.use(
  "/",
  (() => {
    const router = express.Router();
    router.use((req, res, next) => {
      res.setHeader("X-Frame-Options", "SAMEORIGIN");
      next();
    });
    router.use("/article", require("./routes/article/article.js"));
    router.use("/auth", require("./routes/auth/auth.js"));
    router.get("/api", (req, res) => {
      res.json({ message: "Hello API!" });
    });
    router.get("/", (req, res) => {
      res.json("Hello Express!");
    });
    return router;
  })()
);

// error middleware
app.use((err, req, res, next) => {
  res.status(500).json(`500 Internal Server Error: ${err}`);
});

// execute application port
const server = app.listen(port, () => {
  console.log(`listening on *:${port}`);
});
gracefulShutdown(server, {
  signals: "SIGINT SIGTERM",
  timeout: 10000,
  onShutdown: () => {
    return new Promise((resolve, reject) => {
      const { pool } = require("./lib/database/pool");
      pool.end((err) => {
        if (err) {
          return reject(err);
        }
        resolve();
      });
    });
  },
  finally: () => {
    console.info("application finished");
  },
});