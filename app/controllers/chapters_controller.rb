class ChaptersController < ApplicationController

    def index 
        Chapter.destroy_all
        Section.destroy_all
        # using destroy_all method to prevent data from recreating more
        connection = Excon.new('https://s3.amazonaws.com/tocs.flatworldknowledge.com/35880.json')
        get_response = connection.get
        response = JSON.parse(get_response.data[:body])
        response.each{|r| @chapter = Chapter.create(element_id: r["element_id"], ordinal: r["ordinal"], ordinal_name: r["ordinal_name"], type_one: r["type"], title: r["title"])
    r["sections"].each{|r_section| Section.create(section_ordinal: r_section["ordinal"], element_id: r_section["element_id"], ordinal_name: r_section["ordinal_name"], type_one: r_section["type"], title: r_section["title"], chapter_id: @chapter.id)}}
        chapters = Chapter.all
        sections = Section.all

        front_matters = Chapter.select{|chapter| chapter.type_one == "front_matter"}
        render json: {chapters: chapters, sections: sections}
    end

    def show
        # byebug
        chapter = Chapter.find(params[:id])
        render json: {chapter: chapter, chapter_sections: chapter.sections}
    end


end
