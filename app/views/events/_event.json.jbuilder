json.extract! event, :id, :name, :description, :type, :location, :html_link, :start, :end, :slug, :image, :event_id, :i_cal_uid, :created_at, :updated_at
json.url event_url(event, format: :json)