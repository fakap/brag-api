class DeleteBragService
  def initialize brag
    @brag = brag
  end

  def call
    @brag.destroy
  end
end
