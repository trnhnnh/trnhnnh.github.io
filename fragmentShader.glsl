precision mediump float;
varying vec2 vTexCoord;
uniform sampler2D tex;

void main() {
    // Sample the texture at the distorted coordinates
    gl_FragColor = texture2D(tex, vTexCoord);
}
