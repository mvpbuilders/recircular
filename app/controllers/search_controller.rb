class SearchController < ApplicationController
  def index
    query = params[:query].to_s.strip.downcase

    # Podés ajustar este scope si querés buscar en múltiples modelos más adelante
    base_scope = Product.where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", "%#{query}%", "%#{query}%").where(available: true)

    # Agregamos filtros dinámicos según params
    base_scope = base_scope.where(tipo: params[:tipo]) if params[:tipo].present?
    base_scope = base_scope.where(color: params[:color]) if params[:color].present?
    base_scope = base_scope.where("precio <= ?", params[:precio]) if params[:precio].present?
    base_scope = base_scope.where("distancia <= ?", params[:distancia]) if params[:distancia].present?
    base_scope = base_scope.where(talle_ropa: params[:talle_ropa]) if params[:talle_ropa].present?
    base_scope = base_scope.where(talle_zapatilla: params[:talle_zapatilla]) if params[:talle_zapatilla].present?

    @products = base_scope
  end
end
