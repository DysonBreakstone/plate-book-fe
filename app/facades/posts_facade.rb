class PostsFacade
  def pass_muster?(title, body)
    service = Perspective_Service.new
    title_score = service.analyze()
  end
end