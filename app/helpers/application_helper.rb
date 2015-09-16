module ApplicationHelper
  def title page_title
    content_for(:nav) { page_title }
  end

  def menu title, link
    content_for(:menu) {
      link_to(title, link, class:'active')
    }
  end
end
