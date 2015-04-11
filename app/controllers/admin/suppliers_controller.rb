class Admin::SuppliersController < Admin::BaseController
  before_action :set_supplier, only: [:edit, :update]

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def edit
  end

  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to admin_suppliers_path, notice: 'Supplier was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to admin_suppliers_path, notice: 'Supplier was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:company_name, :contact_name)
    end
end
