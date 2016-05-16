module EventsHelper
  def selects_for_kinds(f, kind_name, kind_id)
    #f = form_for helper object
    options_hash = {prompt: '--none--'}
    ea = @event.assets.where(kind: kind_id).first
    if ea
      selector = ea.id
    else
      selector = '--none--'
    end

    select_tag(
      'event[asset_ids][]',
      options_from_collection_for_select(Asset.where(kind: kind_id),
                                         :id,
                                         :name,
                                         selected: selector),
      options_hash)
  end
end
