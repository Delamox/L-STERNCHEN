// property of sora
pragma Singleton
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property list<int> values
    Process {
        running: true
        command: ["sh", "-c", `printf '[general]\nframerate=${Etc.visualiserFramerate}\nbars=22\nlower_cutoff_freq=34\n[output]\nchannels=mono\nmethod=raw\nraw_target=/dev/stdout\ndata_format=ascii\nascii_max_range=100\n[smoothing]\nnoise_reduction=${Etc.visualiserSmoothing}\nmonstercat=0\n[eq]1=1.25\n2=1.125\n3=1.0\n4=0.875\n5=0.75' | cava -p /dev/stdin`]
        stdout: SplitParser {
            onRead: data => {
                root.values = data.slice(0, -1).split(";").map(v => parseInt(v, 10));
            }
        }
    }
}
