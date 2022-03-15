module ApplicationHelper
  
  # ページごとにタイトルを返す
  def full_title(page_name = "") # メソッドの引数の定義
    base_title = "AttendanceApp" # 基本となるアプリケーション名を変数に代入
    if page_name.empty? # 引数を受け取っているか判定
      base_title # 引数pege_nameが空文字の場合はbase_titleのみ返す
    else # 引数pege_nameが空文字ではない場合
      page_name + " | " + base_title # 文字列を連結して返す
    end
  end
  
  def attendance_state(attendance)
    # 受け取ったAttendanceオブジェクトが当日と一致するか評価します。
    if Date.current == attendance.worked_on
      return '出勤' if attendance.started_at.nil?
      return '退勤' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    # どれにも当てはまらなかった場合はfalseを返します。
    false
  end
  
  def working_times(start, finish)
    format("%.2f", (((finish - start) / 60) / 60.0))
  end
end