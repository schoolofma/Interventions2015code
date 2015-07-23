import java.util.Iterator;
import wblut.geom.WB_GeometryOp;
import wblut.geom.WB_Line;
import wblut.geom.WB_Plane;

public class HEM_BendFinger extends HEM_Modifier {
  private WB_Line fingerAxis;
  private double radius;
  private float magnitude;
  private WB_Point center;

  WB_GeometryFactory gf = WB_GeometryFactory.instance();

  public HEM_BendFinger() {
    super();
  }

  public HEM_BendFinger setFingerAxis(final WB_Line a) {
    fingerAxis = a;
    return this;
  }

  public HEM_BendFinger setFingerAxis(final double p1x, final double p1y, 
    final double p1z, final double p2x, final double p2y, 
    final double p2z) {
    fingerAxis = new WB_Line(p1x, p1y, p1z, p2x - p1x, p2y - p1y, p2z - p2y);
    return this;
  }

  public HEM_BendFinger setRadius(final double r) {
    radius = r;
    return this;
  }
  
  public HEM_BendFinger setMagnitude(final float m) {
    magnitude = m;
    return this;
  }

  public HEM_BendFinger setCenter(final WB_Point c) {
    center = c;
    return this;
  }

  @Override
    public HE_Mesh apply(final HE_Mesh mesh) {
    if ((radius > 0) && (fingerAxis != null) && (center != null)) {
      HE_Vertex v;
      final Iterator<HE_Vertex> vItr = mesh.vItr();
      while (vItr.hasNext ()) {
        v = vItr.next();

        final double d = WB_GeometryOp.getDistance3D(v, fingerAxis);
        if (d < radius) {
          final float n = map((float)d, 0, (float)radius, magnitude, 0);
          v.set(gf.createInterpolatedPoint(v, center, n));
        }
      }
    }
    return mesh;
  }

  @Override
    public HE_Mesh apply(final HE_Selection selection) {
    if ((radius > 0) && (fingerAxis != null) && (center != null)) {
      HE_Vertex v;
      final Iterator<HE_Vertex> vItr = selection.vItr();
      while (vItr.hasNext ()) {
        v = vItr.next();

        final double d = WB_GeometryOp.getDistance3D(v, fingerAxis);
        if (d < radius) {
          final float n = map((float)d, 0, (float)radius, magnitude, 0);
          v.set(gf.createInterpolatedPoint(v, center, n));
        }
      }
    }
    return selection.parent;
  }
}