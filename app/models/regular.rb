class Regular < ActiveHash::Base
	self.data = [
		{ id: 1, name: '--' },
		{ id: 2, name: 'タクシー代' },
		{ id: 3, name: 'ガソリン代' },
		{ id: 4, name: '駐車場代' },
		{ id: 5, name: 'バス代' },
		{ id: 6, name: '飲食代' },
		{ id: 7, name: 'パーティ参加費' },
		{ id: 8, name: '香典' },
		{ id: 9, name: '車の修理代' }
	]

	include ActiveHash::Associations
  has_many :items
end
