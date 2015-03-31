# Automatically generated on 2015-03-31T14:32:44-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   struct Hello
#   {
#       int protocolVersion;
#       string versionStr<100>;
#       int listeningPort;
#       opaque peerID[32];
#   };
#
# ===========================================================================
module Stellar
  class Hello < XDR::Struct
    attribute :protocol_version, XDR::Int
    attribute :version_str,      XDR::String[100]
    attribute :listening_port,   XDR::Int
    attribute :peer_id,          XDR::Opaque[32]
  end
end