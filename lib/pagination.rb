class Pagination
  def initialize(records, paginate_by, params)
    @records = records
    @paginate_by = paginate_by
    @params = params
  end

  def total_records
    @records.count
  end

  def total_pages
    return 1 if total_records == 0
    (total_records.to_f / @paginate_by).ceil
  end

  def pages
    start = (this_page > 2 ? this_page - 2 : 1)
    finish = start + 4

    if finish > total_pages
      finish = total_pages
      start = (finish > 4 ? finish - 4 : 1)
    end

    start..finish
  end

  def this_page
    @params[:page].present? ? @params[:page].to_i : 1
  end

  def next_page
    if has_next_page?
      this_page + 1
    else
      this_page
    end
  end

  def previous_page
    if has_previous_page?
      this_page - 1
    else
      this_page
    end
  end

  def first_page
    1
  end

  def last_page
    total_pages
  end

  def is_first_page?
    !@params[:page].present? || @params[:page].to_i == 1
  end

  def is_last_page?
    @params[:page].to_i == total_pages
  end

  def has_next_page?
    this_page < total_pages
  end

  def has_previous_page?
    this_page > 1
  end
end