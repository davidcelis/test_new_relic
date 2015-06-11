class WigglesAPI < BaseAPI
  WIGGLES = [
    { name: 'primordial-mac-n-cheese-wiggle' },
    { name: 'post-cyclic-unupset-wiggle' },
    { name: 'fabled-unmemorialized-wiggle' },
    { name: 'cusped-kindredless-wiggle' },
    { name: 'wool-stapler-quasi-socialistic-wiggle' }
  ]

  let(:wiggle_params) { params.require(:wiggle).permit(:name) }

  get { WIGGLES }

  post do
    WIGGLES << wiggle_params.dup

    head :created
  end

  param :name do
    let(:wiggle) do
      WIGGLES.find { |w| w[:name] == params[:name] } or error! :not_found
    end

    get { wiggle }

    patch do
      wiggle.merge!(wiggle_params)

      wiggle
    end

    delete do
      WIGGLES.delete(wiggle)

      head :no_content
    end
  end
end
