json.array!(@newsletters) do |newsletter|
  json.extract! newsletter, :id, :subject, :html_message, :text_message, :status
  json.url newsletter_url(newsletter, format: :json)
end
