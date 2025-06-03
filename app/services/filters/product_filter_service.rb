module Filters
  class ProductFilterService
    def initialize(scope, params)
      @scope = scope
      @params = params
    end

    def call
      filter_by_tipo
      filter_by_subtipo
      filter_by_talle
      filter_by_color
      filter_by_precio
      filter_by_distancia
      filter_by_dimensiones
      filter_by_estado
      filter_by_envio
      filter_by_material
      filter_by_medidas
      filter_by_marca
      filter_by_owner
      filter_by_genero
      @scope
    end

    private

    def filter_by_tipo
      @scope = @scope.where(tipo: @params[:tipo]) if @params[:tipo].present?
    end

    def filter_by_subtipo
      if @params[:subtipo].present?
        @scope = @scope.where("LOWER(subtipo) = LOWER(?)", @params[:subtipo])
      end
    end




    def filter_by_talle
      if @params[:talle_ropa].present?
        @scope = @scope.where(talle_ropa: @params[:talle_ropa])
      end
      if @params[:talle_zapatilla].present?
        @scope = @scope.where(talle_zapatilla: @params[:talle_zapatilla])
      end
    end

    def filter_by_color
      @scope = @scope.where("LOWER(color) = ?", @params[:color].downcase) if @params[:color].present?
    end

    def filter_by_precio
      if @params[:precio].present?
        @scope = @scope.where("precio IS NULL OR precio <= ?", @params[:precio])
      end
    end

    def filter_by_distancia
      if @params[:distancia].present?
        @scope = @scope.where("distancia IS NULL OR distancia <= ?", @params[:distancia])
      end
    end


    def filter_by_genero
      @scope = @scope.where(genero: @params[:genero]) if @params[:genero].present?
    end


    def filter_by_dimensiones
      @scope = @scope.where("width <= ?", @params[:width]) if @params[:width].present?
      @scope = @scope.where("height <= ?", @params[:height]) if @params[:height].present?
      @scope = @scope.where("depth <= ?", @params[:depth]) if @params[:depth].present?
    end

    def filter_by_estado
      if @params[:estado] == "nuevo"
        @scope = @scope.where(condition: "nuevo")
      end
    end

    def filter_by_owner
      @scope = @scope.where(owner: @params[:owner]) if @params[:owner].present?
    end


    def filter_by_material
      @scope = @scope.where(material: @params[:material]) if @params[:material].present?
    end

    def filter_by_medidas
      @scope = @scope.where("medidas ILIKE ?", "%#{@params[:medidas]}%") if @params[:medidas].present?
    end

    def filter_by_marca
      @scope = @scope.where("LOWER(marca) = ?", @params[:marca].downcase) if @params[:marca].present?
    end


    def filter_by_envio
      if @params[:envio] == "gratis"
        @scope = @scope.where(envio_gratis: true)
      end
    end
  end
end

