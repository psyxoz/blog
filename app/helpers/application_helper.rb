module ApplicationHelper
  def markdown(content = nil)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true
    )
    @markdown.render(content.to_s)
  end
end
