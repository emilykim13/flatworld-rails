class SectionsController < ApplicationController

    def index 
        sections = Section.all
        render json: {sections: sections}
    end

    def show
        section = Section.find(params[:id])
        render json: {section: section, section_chapter: section.chapter}
    end

end
