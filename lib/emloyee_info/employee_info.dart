

class Employee{
  final String firstName, lastName, position, description, profilePicture;
  const Employee({required this.firstName, required this.lastName, required this.position, required this.description, required this.profilePicture});
}




class Employment{
  static const List<Employee> employees = [

    Employee(
      firstName: "Rita",
      lastName: "Popp",
      position: "Principal & Founder",
      profilePicture: "https://i.imgur.com/bAS28Or.jpg",
      description: "  30+ years of progressive leadership and broad software implementation experience. Rita has a solid understanding of how data flows through "
          "integrated systems and the importance of change management drives strategic solutions for business process improvements that provide reduction in TCO "
          "and Increase in ROI. 25+ years of implementing & leading ERP systems including Financials, Project Accounting, Manufacturing, and Supply Chain. HCM – HR, "
          "Payroll, Benefits, Recruitment, Performance, Learning Management, and Succession Planning. 15+ years of experience leading Data Warehouse and Business "
          "Intelligence implementations with an emphasis on data governance – people, process, security, policy, and data quality & change management 10+ years of "
          "Cloud Strategy & Roadmap Development and oversight of Cloud CPM and ERP implementations and integrations.",

    ),

    Employee(
      firstName: "Jim",
      lastName: "Williams",
      position: "Principal & Founder",
      profilePicture: "https://i.imgur.com/bAS28Or.jpg",
      description: "  30+ years technology enablement experience. 15 years focused on progressive management roles leading transformative programs in finance & "
          "accounting, human resources, revenue cycle, procurement, project accounting, supply chain, data warehousing & management, and analytics. 15+ years as "
          "an Executive Technology Consulting Practice Leader. 7+ years leading cloud deployments for high profile companies across multiple industries. Executive "
          "Leader of Analytics, EPM and ERP with proven success delivering solutions that achieve business results. Jim is a trusted, respected, accomplished, and "
          "visionary leader. His experience across 100’s of engagements and multiple verticals has made him a highly sought-after strategic advisor and implementation "
          "consultant.",

    ),


  ];
}