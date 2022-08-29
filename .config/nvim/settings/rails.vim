" ================ Rails Projections ============================
let g:rails_projections = {
\ "config/projections.json": { "command": "projections" },
\ "app/services/*.rb": { "command": "service" },
\ "app/presenters/*.rb": { "command": "presenter" },
\ "app/serializers/*.rb": { "command": "serializer" },
\ "app/queries/*.rb": { "command": "query" },
\ "spec/factories/*.rb": { "command": "factory" },
\ "app/admin/*.rb": { "command": "admin" },
\ "config/*.rb": { "command": "config" },
\ "spec/support/*.rb": {"command": "support" },
\ "spec/features/*_spec.rb": { "command": "feature" }
\ }
