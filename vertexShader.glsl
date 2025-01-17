attribute vec3 aPosition;
attribute vec2 aTexCoord;
uniform mat4 uModelViewProjection;
uniform vec2 uMousePos;  // The mouse position that influences the bulge effect
uniform float uStrength;  // Strength of the bulge effect
varying vec2 vTexCoord;

void main() {
    // Convert mouse position to normalized space (0 to 1)
    vec2 normalizedMouse = uMousePos * 2.0 - 1.0;
    
    // Distance from the mouse position to each vertex
    vec2 dist = aTexCoord - normalizedMouse;
    
    // Apply the bulge effect: distortion increases with distance from the mouse
    float distSq = dot(dist, dist);
    float displacement = exp(-distSq * 10.0) * uStrength;  // Modify `10.0` for more/less distortion

    // Adjust vertex position based on displacement
    vec3 displacedPosition = aPosition.xyz + vec3(dist * displacement, 0.0);
    gl_Position = uModelViewProjection * vec4(displacedPosition, 1.0);
    
    vTexCoord = aTexCoord;  // Pass texture coordinates to fragment shader
}
