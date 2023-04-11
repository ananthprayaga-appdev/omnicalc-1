class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb" })
  end

  def calculate_square_root
    @num_root = params.fetch("square_number").to_f
    @square_root_of_num = Math.sqrt(@num_root)
    render({ :template => "calculation_templates/square_root_results.html.erb" })
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb" })
  end

  def calculate_payment
    @apr = params.fetch("apr").to_f
    @apr = @apr.round(4)
    @r = @apr / (100 * 12)
    @years = params.fetch("years").to_i
    @n = @years * 12
    @principal = params.fetch("principal").to_f
    @pv = @principal
    @principal = @principal.to_s(:currency)
    @payment = (@r * @pv) / (1 - ((1 + @r) ** -(@n)))
    @payment = @payment.to_s(:currency)
    render({ :template => "calculation_templates/payment_results.html.erb" })
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb" })
  end

  def calculate_random
    @min = params.fetch("min").to_f
    @max = params.fetch("max").to_f
    @random = rand(@min..@max)
    render({ :template => "calculation_templates/random_results.html.erb" })
  end
end
