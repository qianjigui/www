# Study from http://www.somic.org/2011/03/04/how-i-organize-posts-in-jekyll/

module Jekyll
    class SortedTagsBuilder < Generator
        safe true
        priority :high

        def generate(site)
            site.config['sorted_tags'] = site.tags.map { |tag, posts|
                [ tag, posts ] }.sort { |a,b| a[0] <=> b[0] }
        end

    end
end
