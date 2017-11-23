module ApplicationHelper

  def link_to_index(url, html_options={})
    _class = 'btn btn-info'
    link_to(tag(:span, {class: 'glyphicon glyphicon-list'}), url, html_options.merge(class: _class, title: 'Back to list'))
  end

  def link_to_show(url, html_options={})
    _class = 'btn btn-info'
    link_to(tag(:span, {class: 'glyphicon glyphicon-info-sign'}), url, html_options.merge(class: _class, title: 'Show'))
  end

  def link_to_pdf(url, html_options={}, label='')
    _class = 'btn btn-info'
    link_to(content_tag(:span, ' ' + label, {class: 'glyphicon glyphicon-print'}), url, html_options.merge(class: _class, title: 'Print'))
  end

  def link_to_new(url, html_options={})
    _class = 'btn btn-success'
    caption = tag(:span, {class: 'glyphicon glyphicon-plus'})
    link_to(caption, url, html_options.merge(class: _class, title: 'New'))
  end

  def link_to_new_item(id, html_options={})
    _class = 'btn btn-success'
    caption = tag(:span, {class: 'glyphicon glyphicon-plus'})
    link_to(caption, '#', html_options.merge(class: _class, title: 'New item', id: id))
  end

  def link_to_edit_function(function, html_options={})
    onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
    href = html_options[:href] || '#'

    name = tag(:span, {class: 'glyphicon glyphicon-edit'})
    _class = 'btn btn-primary'
    content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick, class: _class, title: 'Edit'))
  end

  def link_to_edit(url, html_options={})
    _class = 'btn btn-primary'
    link_to(tag(:span, {class: 'glyphicon glyphicon-edit'}), url, html_options.merge(class: _class, title: 'Edit'))
  end

  def link_to_destroy(url, html_options={})
    _class = 'btn btn-danger'
    link_to(tag(:span, {class: 'glyphicon glyphicon-remove'}), url, html_options.merge(class: _class, data: {confirm: 'Are you sure?', method: :delete, remote: true}, title: 'Destroy'))
  end

  def link_to_refresh(id, html_options={})
    _class = 'btn btn-info'
    caption = tag(:span, {class: 'glyphicon glyphicon-refresh'})
    link_to(caption, '#', html_options.merge(class: _class, title: 'Refresh', id: id))
  end

  def link_to_approve(url, html_options={})
    _class = 'btn btn-success'
    caption = tag(:span, {class: 'glyphicon glyphicon-ok'})
    link_to(caption, url, html_options.merge(class: _class, title: 'Approve'))
  end

  def link_to_review(url, html_options={})
    _class = 'btn btn-info'
    caption = tag(:span, {class: 'glyphicon question-sign'})
    link_to(caption, url, html_options.merge(class: _class, title: 'Review'))
  end

  def status_icon(status)
    if status
      tag(:span, {class: 'glyphicon glyphicon-check'})
    else
      tag(:span, {class: 'glyphicon glyphicon-unchecked'})
    end
  end

  def search_button(id, html_options={})
    button_tag(html_options.merge(type: 'button',  id: id, class: 'btn btn-info')) do
      tag(:span, {class: 'glyphicon glyphicon-search'})
    end
  end

  def edit_button(id, html_options={})
    button_tag(html_options.merge(type: 'button',  id: id, class: 'btn btn-primary')) do
      tag(:span, {class: 'glyphicon glyphicon-edit'})
    end
  end
end
