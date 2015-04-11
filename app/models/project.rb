class Project < ActiveRecord::Base


  def update_from_file(params)

    area_grouping =  ->(group, requirement){
      area = requirement[:area]
      r = /^\s*(\d+)/

      group[:quantity] = area.gsub(r, "#{area.to_s.match(r)[0].to_i + group[:quantity].to_s.match(r)[0].to_i}")
      group
    }

    family_group = {
      'Rectangular Mullion' => ->(group, requirement){ group[:quantity] += requirement[:length]; group },
      'System Panel' => area_grouping,
      'Basic Roof' => area_grouping,
      'Basic Wall' => area_grouping,
      'Curtain Wall' => area_grouping
    }
    

    @xslx = Roo::Excelx.new(params[:file].path)

    requirements = @xslx.sheets[0..3].map do |sheet_name|
      sheet = @xslx.sheet(sheet_name)
      sheet_requirements = sheet.parse(sheet.row(2).reduce({}){|hsh,v| hsh[v.parameterize.underscore.to_sym] = v; hsh})
      sheet_requirements = sheet_requirements.slice(2..-1)

    end.flatten.reduce({}) do |hsh, requirement|
      hsh[requirement[:family]] ||= { name: requirement[:family], types: {} }
      hsh[requirement[:family]][:types][requirement[:type]] ||= { name: requirement[:type], quantity: 0, price_per_unit: 1 }

      hsh[requirement[:family]][:types][requirement[:type]] = family_group[requirement[:family]].call(hsh[requirement[:family]][:types][requirement[:type]], requirement)

      hsh
    end.values

    raise

    
  end




end
