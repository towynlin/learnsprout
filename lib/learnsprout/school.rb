module LearnSprout
  class School
    include LearnSprout::Connection

    attr_accessor :school_id,
                  :name,
                  :number,
                  :nces,
                  :phone,
                  :address

    def initialize(attrs={})
        @client = attrs["client"]
        @org_id = attrs["org_id"]
        @school_id = attrs["id"]
        @name = attrs["name"]
        @number = attrs["number"]
        @nces = Nces.new(attrs["nces"])
        @phone = Phone.new(attrs["phone"])
        @address = Address.new(attrs["address"])
    end

    #TODO Add org method?

    def student(student_id)
        @client.student(@org_id, student_id)
    end

    def students
      @client.students(@org_id, :school_id => @school_id)
    end

    def section(section_id)
        @client.section(@org_id, section_id)
    end

    def sections
      @client.sections(@org_id, :school_id => @school_id)
    end

    def teacher(teacher_id)
        @client.teacher(@org_id, teacher_id)
    end

    def teachers
      @client.teachers(@org_id, :school_id => @school_id)
    end

    def term(term_id)
        @client.term(@org_id, term_id)
    end

    def terms
      @client.terms(@org_id, :school_id => @school_id)
    end

    def current_term
      @client.current_term(@org_id, @school_id)
    end

    def course(course_id)
        @client.course(@org_id, course_id)
    end

    def courses
      @client.courses(@org_id, :school_id => @school_id)
    end
  end
end 