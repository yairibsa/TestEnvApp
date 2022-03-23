module GuidesHelper
    def gravatar_helper user
        image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 40
    end
    
    class CodeRayify < Redcarpet::Render::HTML
        def block_code(code, languege)
            CodeRay.scan(code, languege).div
        end
    end
    
    def markdown(text)
        coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
        
        options = {
            fenced_code_blocks: true,
            no_intra_emphasis: true,
            autolink: true,
            lax_html_blocks: true,
        }
        
        markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
        markdown_to_html.render(text).html_safe
    end
    
    def guide_status_color guide
        if guide.draft?
            'color: red;'
        end
    end
        
end
