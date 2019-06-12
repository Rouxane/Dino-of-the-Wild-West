// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		_White_cap_Base_Color("White_cap_Base_Color", 2D) = "white" {}
		_White_cap_Normal_DirectX("White_cap_Normal_DirectX", 2D) = "bump" {}
		_White_cap_Roughness("White_cap_Roughness", 2D) = "white" {}
		_Opacity("Opacity", 2D) = "white" {}
		_Mixed_AO("Mixed_AO", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _White_cap_Normal_DirectX;
		uniform float4 _White_cap_Normal_DirectX_ST;
		uniform sampler2D _White_cap_Base_Color;
		uniform float4 _White_cap_Base_Color_ST;
		uniform sampler2D _White_cap_Roughness;
		uniform float4 _White_cap_Roughness_ST;
		uniform sampler2D _Mixed_AO;
		uniform float4 _Mixed_AO_ST;
		uniform sampler2D _Opacity;
		uniform float4 _Opacity_ST;
		uniform float _Cutoff = 0.5;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_White_cap_Normal_DirectX = i.uv_texcoord * _White_cap_Normal_DirectX_ST.xy + _White_cap_Normal_DirectX_ST.zw;
			o.Normal = UnpackNormal( tex2D( _White_cap_Normal_DirectX, uv_White_cap_Normal_DirectX ) );
			float2 uv_White_cap_Base_Color = i.uv_texcoord * _White_cap_Base_Color_ST.xy + _White_cap_Base_Color_ST.zw;
			o.Albedo = tex2D( _White_cap_Base_Color, uv_White_cap_Base_Color ).rgb;
			float2 uv_White_cap_Roughness = i.uv_texcoord * _White_cap_Roughness_ST.xy + _White_cap_Roughness_ST.zw;
			o.Smoothness = ( 1.0 - tex2D( _White_cap_Roughness, uv_White_cap_Roughness ) ).r;
			float2 uv_Mixed_AO = i.uv_texcoord * _Mixed_AO_ST.xy + _Mixed_AO_ST.zw;
			o.Occlusion = tex2D( _Mixed_AO, uv_Mixed_AO ).r;
			o.Alpha = 1;
			float2 uv_Opacity = i.uv_texcoord * _Opacity_ST.xy + _Opacity_ST.zw;
			clip( tex2D( _Opacity, uv_Opacity ).r - _Cutoff );
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
56;46;1813;1004;1082.88;410.7619;1.3;True;True
Node;AmplifyShaderEditor.SamplerNode;3;-570.099,90.59964;Float;True;Property;_White_cap_Roughness;White_cap_Roughness;3;0;Create;True;0;0;False;0;e441577ff67671f408544f34fa304480;e441577ff67671f408544f34fa304480;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-431.7001,537.7;Float;True;Property;_Opacity;Opacity;4;0;Create;True;0;0;False;0;3d08ca788d0a208438a6689908bfae4e;3d08ca788d0a208438a6689908bfae4e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;5;-501.5999,314.5;Float;True;Property;_Mixed_AO;Mixed_AO;5;0;Create;True;0;0;False;0;a24d346131c3fa645ae61d17fdc50bc8;a24d346131c3fa645ae61d17fdc50bc8;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;6;-243.0804,133.938;Float;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;1;-288.1002,-310.8999;Float;True;Property;_White_cap_Base_Color;White_cap_Base_Color;1;0;Create;True;0;0;False;0;8dc0c54e80a440641ab579a5187e6672;8dc0c54e80a440641ab579a5187e6672;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-509.8992,-121.3;Float;True;Property;_White_cap_Normal_DirectX;White_cap_Normal_DirectX;2;0;Create;True;0;0;False;0;9121f1386e00de24a8a8795d4c421b63;9121f1386e00de24a8a8795d4c421b63;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;6;0;3;0
WireConnection;0;0;1;0
WireConnection;0;1;2;0
WireConnection;0;4;6;0
WireConnection;0;5;5;0
WireConnection;0;10;4;0
ASEEND*/
//CHKSM=F9BF4F5DC4C13A591AEFB1A253D3D2F867E6E0B3