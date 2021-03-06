# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Photo.destroy_all
Category.destroy_all
MainCategory.destroy_all

Size.destroy_all
Format.destroy_all
Mat.destroy_all
CategoryMat.destroy_all

DatabaseCleaner.clean_with(:truncation, :only => %w[photos])
DatabaseCleaner.clean_with(:truncation, :only => %w[categories])
DatabaseCleaner.clean_with(:truncation, :only => %w[main_categories])

DatabaseCleaner.clean_with(:truncation, :only => %w[sizes])
DatabaseCleaner.clean_with(:truncation, :only => %w[formats])
DatabaseCleaner.clean_with(:truncation, :only => %w[mats])
DatabaseCleaner.clean_with(:truncation, :only => %w[category_mats])



CSV.foreach("#{Rails.root}/lib/assets/Photo.csv", headers: true) do |row|
     Photo.create(
        :id_num => row[0],
        :title => row[1],
        :main_category => row[2],
        :sub_category => row[3] ,
        :category_id => row[4],
        :desc => row[5],
        :is_active => row[6],
        :artist_name => row[7],
        :year_taken => row[8],
        :format_id => row[9],
        :show_bw_conversion => row[10],
        :rotating_keyword => row[11]
      )
end

CSV.foreach("#{Rails.root}/lib/assets/Category.csv", headers: true) do |row|
     Category.create(
        :title => row[0],
        :description => row[1],
        :main_category => row[2],
        :super_category => row[3],
        :is_active => row[4],
        :meta_title => row[5],
        :meta_desc => row[6],
        :alt_tag => row[7]

      )

end

CSV.foreach("#{Rails.root}/lib/assets/MainCategory.csv", headers: true) do |row|
     MainCategory.create(
        :title => row[0]
        # :description => row[1],
        # :main_category => row[2],
        # :super_category => row[3],
        # :is_active => row[4],
        # :meta_title => row[5],
        # :meta_desc => row[6],
        # :alt_tag => row[7],
        # :main_category_id => row[8]
      )

end

CSV.foreach("#{Rails.root}/lib/assets/Size.csv", headers: true) do |row|
     Size.create(
        :name => row[0],
        :product_weight => row[1],
        :box_weight => row[2],
        :declared_value => row[3] ,
        :price => row[4],
        :product_ads_extension => row[5],
        :format_id => row[6]


      )

end

CSV.foreach("#{Rails.root}/lib/assets/Format.csv", headers: true) do |row|
     Format.create(
        :name => row[0]
      )

end

CSV.foreach("#{Rails.root}/lib/assets/Mat.csv", headers: true) do |row|
     Mat.create(
        :name => row[0]
      )

end

CSV.foreach("#{Rails.root}/lib/assets/CategoryMat.csv", headers: true) do |row|
     CategoryMat.create(
        :category_id => row[0],
        :mat_id => row[1]
      )

end

