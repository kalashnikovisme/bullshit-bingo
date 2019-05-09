require 'axlsx'

array = File.readlines('data.csv')
count = ARGV[0].to_i
column_count = ARGV[1].to_i
row_count = ARGV[2].to_i
Axlsx::Package.new do |p|
  count.times do |iteration|
    ids = (0..array.count - 1).to_a.sort do
      rand() - 0.5
    end[0..column_count * row_count]
    p.workbook.add_worksheet name: iteration.to_s do |sheet|
      row_count.times do |row_index|
        row = ((0..column_count).to_a.map do |column_index|
          array[ids[row_index * column_count + column_index]]
        end)
        sheet.add_row row,
          style: sheet.styles.add_style(alignment: {
            horizontal: :center,
            vertical: :center,
            wrap_text: true
          }),
          widths: (0..column_count).to_a.map { 25 },
          height: 100
      end
    end
    p.serialize 'result.xlsx'
  end
end
