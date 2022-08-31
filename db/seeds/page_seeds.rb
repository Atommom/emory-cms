require "json"

def import_pages
  Dir.foreach("#{Rails.root}/db/data/nodes") {|filename|
    if filename != "." and filename != ".."
      file = File.read("#{Rails.root}/db/data/nodes/#{filename}")
      pageInfo = JSON.parse(file)
      Page.create({
        slug: pageInfo['path'],
        header_title: pageInfo['page_props']['header'],
        header_desc: pageInfo['page_props']['text'],
        header_about: pageInfo['page_props']['about'],
        scroll_text: pageInfo['page_props']['button_scroll'],
        featured_img: pageInfo['page_props']['img_src'],
        meta_title: pageInfo['metatag']['title'],
        meta_desc: pageInfo['metatag']['description'],
        meta_img: pageInfo['metatag']['image'],
        footer: pageInfo['footer'] || {},
        components: pageInfo['components']
      })
    end
  }
end
