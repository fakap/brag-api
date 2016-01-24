class UpdateBragService
  def initialize brag, brag_attributes
    @brag = brag
    @brag.assign_attributes(brag_attributes)
  end

  def call
    @brag.save
    @brag
  end
end
