module DataTable
  class Options
    attr_reader :draw, :columns, :order, :start, :length, :search
    def initialize(options)
      default = {'draw' => '1', 'columns' => {}, 'order' => {}, 'start' => 0, 'length' => DataTable::DEFAULT_DISPLAY_LENGTH, 'search' => {}}
      %w{draw columns order start length search}.each do |opt|
        instance_variable_set("@#{opt}", options.fetch(opt, default[opt]))
      end

      @sorting = @order.values.map{|o| "#{@columns[o['column']]['name']} #{o['dir']}"}
    end

    def sorting_string
      @sorting.join(', ')
    end

    def search_string
      @search['value']
    end
  end
end
