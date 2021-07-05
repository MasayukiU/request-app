class Position < ActiveHash::Base
	self.data = [
		{ id: 1, name: '--' },
		{ id: 2, name: '主任' },
		{ id: 3, name: '課長' },
		{ id: 4, name: '次長' },
		{ id: 5, name: '部長' },
		{ id: 6, name: 'その他' }
	]

	include ActiveHash::Associations
  has_many :users
end
