module Fog
  module XenServer
    class Compute
      module Models
        class VifMetrics < Model
          # API Reference here:
          # http://docs.vmd.citrix.com/XenServer/6.2.0/1.0/en_gb/api/?c=VIF_metrics

          provider_class :VIF_metrics
          collection_name :vifs_metrics

          identity :reference

          attribute :io_read_kbs
          attribute :io_write_kbs
          attribute :last_updated
          attribute :other_config
          attribute :uuid
        end
      end
    end
  end
end