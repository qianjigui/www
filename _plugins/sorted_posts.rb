# Study from http://www.somic.org/2011/03/04/how-i-organize-posts-in-jekyll/

module Jekyll
    class SortedPostsBuilder < Generator
        safe true
        priority :high

        def generate(site)
            site.config['sorted_ctime_posts'] = site.posts.
                select{|a|
                a.id.include?('it/technical')
            }.
            sort { |a,b| b.date <=> a.date }[0..12]
            site.config['sorted_mtime_posts'] = site.posts.
                select{|a| a.data['lmtime']!=nil}.
                sort { |a,b| b.data['lmtime'] <=> a.data['lmtime'] }[0..12]
        end

    end
end
