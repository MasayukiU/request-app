class Team < ActiveHash::Base
	self.data = [
		{ id: 1, name: '--' },
		{ id: 2, name: '営業部' },
		{ id: 3, name: '設計部' },
		{ id: 4, name: '総務部' },
		{ id: 5, name: '法務部' },
		{ id: 6, name: '経理部' },
		{ id: 7, name: '生産管理部' },
		{ id: 8, name: 'その他' }
	]

	include ActiveHash::Associations
  has_many :items
end
