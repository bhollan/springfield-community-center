
refactor omniauth config to use dotenv gem
refactor with class: Kind (speaker, tables,...)
refactor with Pundit/cancancan to add admins that can create new assets
refactor to make extensible to ConventionCenter, RentACenter, etc...
refactor navigation to use Asset class method #kinds
refactor in an event agenda/description or something
refactor 'public' field to something less 'reserved word'-y

add Services/EventServices (setup-and-take-down, dj, hosting, crowd control, concierge)
add User class method to count users with no events

NEXT:

users can see their private events in show (with edit button)
users can see their private events in index
non-event-owning users cannot see others' private events in index or show (with alert message)
non-event-owning users can see others' private events in the user show page
future events can be edited/cancelled
past events cannot be created/edited/deleted


BULLETS:
  1: Rails
  2: has_many, belongs_to, has_many, through:
3: EventAsset needs attribute(s)
4: Model validations
5: Asset#most_used / projector#events(?)
6: User management of EventAssets
  7: Devise
  8: OmniAuth
9: Nested resource(s): /events/12/event_assets/select
10: Validation errors in 'field_with_errors'
  11: DRY

