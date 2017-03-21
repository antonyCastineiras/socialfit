describe Event do
	it "returns open as a string when the group is open" do
		event = Event.new(name: "event", info: "some info", start_time: "03/03/2017,12:30", postcode: "ox26 3yp", open: true)
		expect(event.open_to_s).to eq 'open'
	end

	it "returns closed as a string when the group is closed" do
		event = Event.new(name: "event", info: "some info", start_time: "03/03/2017,12:30", postcode: "ox26 3yp", open: false)
		expect(event.open_to_s).to eq 'closed'
	end
end