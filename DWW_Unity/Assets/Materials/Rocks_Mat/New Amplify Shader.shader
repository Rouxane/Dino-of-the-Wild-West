// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "New Amplify Shader"
{
	Properties
	{
		_DRF_Rocks_Albedo("DRF_Rocks_Albedo", 2D) = "white" {}
		_DRF_Rocks_AO("DRF_Rocks_AO", 2D) = "white" {}
		_DRF_Rocks_DetailNRM("DRF_Rocks_DetailNRM", 2D) = "bump" {}
		_DRF_Rocks_Specular("DRF_Rocks_Specular", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "TransparentCutout"  "Queue" = "AlphaTest+0" }
		Cull Back
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf StandardSpecular keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _DRF_Rocks_DetailNRM;
		uniform float4 _DRF_Rocks_DetailNRM_ST;
		uniform sampler2D _DRF_Rocks_Albedo;
		uniform float4 _DRF_Rocks_Albedo_ST;
		uniform sampler2D _DRF_Rocks_Specular;
		uniform float4 _DRF_Rocks_Specular_ST;
		uniform sampler2D _DRF_Rocks_AO;
		uniform float4 _DRF_Rocks_AO_ST;

		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			float2 uv_DRF_Rocks_DetailNRM = i.uv_texcoord * _DRF_Rocks_DetailNRM_ST.xy + _DRF_Rocks_DetailNRM_ST.zw;
			o.Normal = UnpackNormal( tex2D( _DRF_Rocks_DetailNRM, uv_DRF_Rocks_DetailNRM ) );
			float2 uv_DRF_Rocks_Albedo = i.uv_texcoord * _DRF_Rocks_Albedo_ST.xy + _DRF_Rocks_Albedo_ST.zw;
			o.Albedo = tex2D( _DRF_Rocks_Albedo, uv_DRF_Rocks_Albedo ).rgb;
			float2 uv_DRF_Rocks_Specular = i.uv_texcoord * _DRF_Rocks_Specular_ST.xy + _DRF_Rocks_Specular_ST.zw;
			o.Specular = tex2D( _DRF_Rocks_Specular, uv_DRF_Rocks_Specular ).rgb;
			float2 uv_DRF_Rocks_AO = i.uv_texcoord * _DRF_Rocks_AO_ST.xy + _DRF_Rocks_AO_ST.zw;
			o.Occlusion = tex2D( _DRF_Rocks_AO, uv_DRF_Rocks_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16301
29;71;1813;1004;1054.875;489.4092;1.3;True;True
Node;AmplifyShaderEditor.SamplerNode;4;-512.5,-248.5;Float;True;Property;_DRF_Rocks_DetailNRM;DRF_Rocks_DetailNRM;3;0;Create;True;0;0;False;0;c7a05666902a4fb44803b98f302f2abb;c7a05666902a4fb44803b98f302f2abb;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;5;-547.2997,-25.90008;Float;True;Property;_DRF_Rocks_Specular;DRF_Rocks_Specular;4;0;Create;True;0;0;False;0;70349240a0b1d2541b301251216bca53;70349240a0b1d2541b301251216bca53;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;2;-540.5001,176.4999;Float;True;Property;_DRF_Rocks_AO;DRF_Rocks_AO;2;0;Create;True;0;0;False;0;3cff736b1c6438f479603a26e18c5fc8;3cff736b1c6438f479603a26e18c5fc8;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-352.5,-469.5002;Float;True;Property;_DRF_Rocks_Albedo;DRF_Rocks_Albedo;1;0;Create;True;0;0;False;0;857c0ee37bd38f640a3eaf22f60ebabd;857c0ee37bd38f640a3eaf22f60ebabd;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-24.00012,22.4001;Float;False;True;2;Float;ASEMaterialInspector;0;0;StandardSpecular;New Amplify Shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Masked;0.5;True;True;0;False;TransparentCutout;;AlphaTest;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;0;0;1;0
WireConnection;0;1;4;0
WireConnection;0;3;5;0
WireConnection;0;5;2;0
ASEEND*/
//CHKSM=FD78B7A8AF45DC09EEA01B57305E1998D77847A0