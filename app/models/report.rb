class Report < ApplicationRecord
  belongs_to :zens, class_name: 'Zen'
end
