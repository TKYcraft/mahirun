require 'rails_helper'

RSpec.describe "Minecraft::Api::V1::Faces", type: :request do
	describe "show action" do
		context "give name of exist user to params" do
			it "success 200" do
				# Act
				get minecraft_api_v1_face_path("KrisJelbring")

				# Assert
				expect(response).to have_http_status(200)
			end
		end

		context "give name of none-exist user to params" do
			it "success 200" do
				# Act
				get minecraft_api_v1_face_path("0")

				# Assert
				expect(response).to have_http_status(200)
			end
		end
	end
end
