class Listing < ActiveRecord::Base
  validates :street, :price, :bedrooms, :bathrooms, :sq_ft, :lat, :lng, presence: true

  def self.search(params)

    sql_params = {
      min_bath:  params[:min_bath]  || Listing.min_bath,
      max_bath:  params[:max_bath]  || Listing.max_bath,
      min_bed:   params[:min_bed]   || Listing.min_bed,
      max_bed:   params[:max_bed]   || Listing.max_bed,
      min_price: params[:min_price] || Listing.min_price,
      max_price: params[:max_price] || Listing.max_price,
      page:      params[:page]      || 1,
      per:       10
    }

    Listing.find_by_sql([<<-SQL, sql_params])
      SELECT
        *
      FROM
        listings l
      WHERE
        (l.bathrooms >= :min_bath) AND
        (l.bathrooms <= :max_bath) AND
        (l.bedrooms  >= :min_bed)  AND
        (l.bedrooms  <= :max_bed)  AND
        (l.price  >= :min_price)   AND
        (l.price  <= :max_price)
      LIMIT
        :per
      OFFSET
        :per * (:page - 1)
    SQL
  end

  private

  def self.min_bath
    @@min_bath ||= Listing.minimum(:bathrooms)
    @@min_bath
  end

  def self.max_bath
    @@max_bath ||= Listing.maximum(:bathrooms)
    @@max_bath
  end

  def self.min_bed
    @@min_bed ||= Listing.minimum(:bedrooms)
    @@min_bed
  end

  def self.max_bed
    @@max_bed ||= Listing.minimum(:bedrooms)
    @@max_bed
  end

  def self.min_price
    @@min_price ||= Listing.minimum(:price)
    @@min_price
  end

  def self.max_price
    @@max_price ||= Listing.minimum(:price)
    @@max_price
  end

end
