require "bc-drill-manager/version"

module BcDrillManager

  # Struct inheritance:
  # https://stackoverflow.com/questions/6891258/ruby-structs-and-named-parameters-inheritance#6891452

  # Corresponds to the UML model of the same name.
  class ActivityCategory
    attr_accessor :activities
    def initialize(activities: [])
      @activities = activities
    end
  end

  # Corresponds to the UML model of the same name.
  class BusinessActivity
    attr_accessor :plans
    def initialize(plans: [])
      @plans = plans
    end
  end

  # Corresponds to the UML model of the same name.
  class DrillPlan
    attr_accessor :purpose, :what_to_record, :version, :resource_requirements,
                  :preparation_steps, :drill_steps

    def initialize(
      purpose:,
      resource_requirements: [],
      preparation_steps: [],
      drill_steps: [],
      what_to_record:,
      version:
    )
      @purpose               = purpose
      @resource_requirements = resource_requirements
      @preparation_steps     = preparation_steps
      @drill_steps           = drill_steps
      @what_to_record        = what_to_record
      @version               = version
    end
  end

  # Corresponds to the UML model of the same name.
  class Requirement
    attr_accessor :description
    def initialize(description: "")
      @description = description
    end
  end

  # Corresponds to the UML model of the same name.
  class Step
    attr_accessor :description
    def initialize(description: "")
      @description = description
    end
  end

  # Corresponds to the UML model of the same name.
  class DrillStep < Step
    attr_accessor :time_allowed

    def initialize(description: "", time_allowed:)
      super
      @time_allowed = time_allowed
    end
  end

  # Corresponds to the UML model of the same name.
  class DrillStepResult
    attr_accessor :step, :result, :start_time, :end_time, :responsible,
                  :participants, :drill_type

    def initialize(
      step:,
      result:,
      start_time:,
      end_time:,
      responsible: [],
      participants: [],
      drill_type: []
    )
      @step         = step
      @result       = result
      @start_time   = start_time
      @end_time     = end_time
      @responsible  = responsible
      @participants = participants
    end

    def duration
      end_time - start_time if end_time && start_time
    end
  end

  # Corresponds to the UML model of the same name.
  class Result
    attr_accessor :description
    def initialize(description: "")
      @description = description
    end
  end

  # Correspond to the UML models of the same names.
  class Success      < Result; end
  class Failure      < Result; end
  class Skipped      < Result; end
  class Undetermined < Result; end

  # Corresponds to the UML model of the same name.
  class Participant
    attr_accessor :name
    def initialize(name: "")
      @name = name
    end
  end

  # Corresponds to the UML model of the same name.
  class DrillReport
    attr_accessor :follow_up_action, :step_results, :author
    def initialize(
      follow_up_action:,
      step_results: [],
      authors: [],
      plan_version:
    )
      @follow_up_action = follow_up_action
      @step_results     = step_results
      @authors          = authors
      @plan_version     = plan_version
    end

    def start_time
      step_results.first&.start_time
    end
  end

  # Correspond to the UML models of the same names.
  class Label; end
  class DrillTypeLabel < Label; end
  class TableTop       < DrillTypeLabel; end
  class Live           < DrillTypeLabel; end
  class Discussion     < DrillTypeLabel; end
end
