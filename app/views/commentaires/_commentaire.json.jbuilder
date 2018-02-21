json.extract! commentaire, :id, :pseudo, :body, :created_at, :updated_at
json.url commentaire_url(commentaire, format: :json)
