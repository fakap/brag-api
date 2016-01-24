class CreateBragService
  def initialize brag_attributes
    @brag = Brag.new(
      user_id: brag_attributes[:id],
      title:   brag_attributes[:title],
      story:   brag_attributes[:story],
      photo:   brag_attributes[:photo],
    )
  end

  def call
    @brag.save
    @brag
  end
end
