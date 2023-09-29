class ProductosController < ApplicationController
  def index
    @productos = Producto.all
  end

  def show
    @producto = Producto.find(params[:id])
  end
  
  def new
    @producto = Producto.new
  end

  def create
    @producto = Producto.new(producto_params) # Utiliza strong parameters para proteger contra ataques de asignación masiva
    if @producto.save
      # Éxito: redirige a la página del producto recién creado
      redirect_to @producto
    else
      # Error: vuelve a mostrar el formulario de creación con errores de validación
      render 'new'
    end
  end
  
  private
  
  def producto_params
    params.require(:producto).permit(:nombre, :descripcion, :precio)
  end

  def edit
    @producto = Producto.find(params[:id])
  end

  def update
    @producto = Producto.find(params[:id])
    if @producto.update(producto_params)
      # Éxito: redirige a la página del producto actualizado
      redirect_to @producto
    else
      # Error: vuelve a mostrar el formulario de edición con errores de validación
      render 'edit'
    end
  end

  def destroy
    @producto = Producto.find(params[:id])
    @producto.destroy
    # Redirige a la lista de productos después de eliminar uno
    redirect_to productos_path
  end
  
end
