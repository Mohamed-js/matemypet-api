class Api::V1::TrialsController < Api::V1::ApiController 
    include TrialsHelper
    def index
        sayHello
    end
end
