module Admin::StatusHelper
  def status(resource)
    case
    when resource.draft == true then "Draft"
    when resource.draft == false then "Published"
    end
  end
end
