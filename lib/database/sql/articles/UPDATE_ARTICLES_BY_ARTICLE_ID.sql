UPDATE
  articles
SET
  title = ?,
  letter_body = ?,
  created_at = ?,
  public = ?,
  article_id_of_storage = ?,
  file_names = ?,
  images_url = ?
WHERE
  id = ?