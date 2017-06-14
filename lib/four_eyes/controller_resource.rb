module FourEyes
  class ControllerResource

    # Define the dynamic maker_create function
    # This handles the storing of the action and it's meta data to the four_eyes_actions
    # table with the status of 'Initiated'
    #
    def self.add_maker_create_function(controller_class, method, *args)
      options = args.extract_options!
      controller_class.send :define_method, method do |*args|
        "#{method} #{args}"
        resource_class_name = args[0]
        resource_id = args[1]
        checker_role = args[2]
        object_class_name = args[3]
        data = args[4]

        action = FourEyes::Action.new(resource_class_name: resource_class_name,
                                      maker_resource_id: resource_id,
                                      action_type: 'action_create',
                                      checker_resource_role: checker_role,
                                      object_resource_class_name: object_class_name,
                                      status: 'Initiated',
                                      data: data)
        if action.save!
          true
        else
          # TODO dondeng - Better to raise an exception here
          false
        end
      end
    end

    def self.add_maker_update_function(controller_class, method, *args)
      options = args.extract_options!
      controller_class.send :define_method, method do |*args|
        resource_class_name = args[0]
        resource_id = args[1]
        checker_role = args[2]
        object_class_name = args[3]
        object_resource_id = args[4]
        data = args[5]

        action = FourEyes::Action.new(resource_class_name: resource_class_name,
                                      maker_resource_id: resource_id,
                                      action_type: 'action_update',
                                      checker_resource_role: checker_role,
                                      object_resource_class_name: object_class_name,
                                      object_resource_id: object_resource_id,
                                      status: 'Initiated',
                                      data: data)
        if action.save
          true
        else
          # TODO - dondeng - Better to raise an exception here
          false
        end
      end
    end

    def self.add_maker_delete_function(controller_class, method, *args)
      options = args.extract_options!
      controller_class.send  :define_method, method do |*args|
        resource_class_name = args[0]
        resource_id = args[1]
        checker_role = args[2]
        object_class_name = args[3]
        object_resource_id = args[4]
        data = args[5]

        action = FourEyes::Action.new(resource_class_name: resource_class_name,
                                      maker_resource_id: resource_id,
                                      action_type: 'action_delete',
                                      checker_resource_role: checker_role,
                                      object_resource_class_name: object_class_name,
                                      object_resource_id: object_resource_id,
                                      status: 'Initiated',
                                      data: data)
        if action.save
          true
        else
          # TODO - dondeng - Better to raise an exception here
          false
        end
      end
    end

    def self.add_maker_generic_function(controller_class, method, *args)
      options = args.extract_options!
      controller_class.send  :define_method, method do |*args|
        resource_class_name = args[0]
        resource_id = args[1]
        checker_role = args[2]
        object_class_name = args[3]
        object_resource_id = args[4]
        action = args[5]
        data = args[6]

        action = FourEyes::Action.new(resource_class_name: resource_class_name,
                                      maker_resource_id: resource_id,
                                      action_type: action,
                                      checker_resource_role: checker_role,
                                      object_resource_class_name: object_class_name,
                                      object_resource_id: object_resource_id,
                                      status: 'Initiated',
                                      data: data)
        if action.save
          true
        else
          # TODO - dondeng - Better to raise an exception here
          false
        end
      end
    end

    def initialize(controller, *args)
      @controller = controller
      @params = controller.params
      @options = args.extract_options!
      @name = args.first
    end
  end
end
